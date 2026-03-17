#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>

#include "hdf_log.h"                // 标准日志接口头文件
#include "gpio_if.h"                // GPIO标准接口头文件

// 定义版本号
#define SOFTWARE_VERSION            "V1.0"

// 打印信息，用于打印普通信息
#define PRINT_INFO(fmt, args...)    printf("%s, %s, %d, info: "fmt, __FILE__, __func__, __LINE__, ##args)
// 打印信息，用于打印错误信息
#define PRINT_ERROR(fmt, args...)   printf("%s, %s, %d, error: "fmt, __FILE__, __func__, __LINE__, ##args)

// GPIO引脚序号
static uint16_t m_gpio_id = 0;
// GPIO引脚是否设置为输入，GPIO_DIR_OUT为输出，GPIO_DIR_IN为输入
static uint16_t m_gpio_dir = GPIO_DIR_IN;
// GPIO引脚的高低电平，GPIO_VAL_LOW为低电平，GPIO_VAL_HIGH为高电平
static uint16_t m_gpio_value = GPIO_VAL_LOW;


///////////////////////////////////////////////////////////


/***************************************************************
* 函数名称: main_help
* 说    明: 帮助文档
* 参    数: 无
* 返 回 值: 无
***************************************************************/
void main_help(char *cmd)
{
    printf("%s: platform device gpio\n", cmd);
    printf("Version: %s\n", SOFTWARE_VERSION);
    printf("%s [options]...\n", cmd);
    printf("    -g, --gpio          gpio id\n");
    printf("    -v, --value         the value of gpio, 0 is low, 1 is high\n");
    printf("    -o, --out           gpio dir set to out\n");
    printf("    -i, --in            gpio dir set to in\n");
    printf("    -h, --help          help info\n");
    printf("\n");
}


/***************************************************************
* 函数名称: parse_opt
* 说    明: 解析参数
* 参    数:
*           @argc:  参数数量
*           @argv:  参数变量数组
* 返 回 值: 无
***************************************************************/
void parse_opt(int argc, char *argv[])
{
    while (1) {
        struct option long_opts[] = {
            { "gpio",           required_argument,  NULL, 'g' },
            { "value",          required_argument,  NULL, 'v' },
            { "out",            no_argument,        NULL, 'o' },
            { "in",             no_argument,        NULL, 'i' },
            { "help",           no_argument,        NULL, 'h' },
        };
        int option_index = 0;
        int c;

        c = getopt_long(argc, argv, "g:v:oih", long_opts, &option_index);
        if (c == -1) break;

        switch (c) {
        case 'g':
            m_gpio_id = (uint16_t)atoi(optarg);
            break;

        case 'v':
            m_gpio_value = (uint16_t)atoi(optarg);
            break;

        case 'o':
            m_gpio_dir = GPIO_DIR_OUT;
            break;

        case 'i':
            m_gpio_dir = GPIO_DIR_IN;
            break;

        case 'h':
        default:
            main_help(argv[0]);
            exit(0);
            break;
        }
    }
}


/***************************************************************
* 函数名称: main
* 说    明: 主函数，用于GPIO控制
* 参    数:
*           @argc:  参数数量
*           @argv:  参数变量数组
* 返 回 值: 0为成功，反之为错误
***************************************************************/
int main(int argc, char* argv[])
{
    int32_t ret;

    // 解析参数
    parse_opt(argc, argv);
    printf("gpio id: %d\n", m_gpio_id);
    printf("gpio dir: %s\n", ((m_gpio_dir == GPIO_DIR_OUT) ? ("out") : ("in")));
    printf("gpio value: %d\n", m_gpio_value);

    if (m_gpio_dir == GPIO_DIR_OUT) {
        // GPIO设置为输出
        ret = GpioSetDir(m_gpio_id, GPIO_DIR_OUT);
        if (ret != 0) {
            PRINT_ERROR("GpioSetDir failed and ret = %d\n", ret);
            return -1;
        }

        // GPIO输出电平
        ret = GpioWrite(m_gpio_id, m_gpio_value);
        if (ret != 0) {
            PRINT_ERROR("GpioWrite failed and ret = %d\n", ret);
            return -1;
        }
    } else {
        // GPIO设置为输出
        ret = GpioSetDir(m_gpio_id, GPIO_DIR_IN);
        if (ret != 0) {
            PRINT_ERROR("GpioSetDir failed and ret = %d\n", ret);
            return -1;
        }

        // 读取GPIO引脚的电平
        ret = GpioRead(m_gpio_id, &m_gpio_value);
        if (ret != 0) {
            PRINT_ERROR("GpioRead failed and ret = %d\n", ret);
            return -1;
        }

        printf("GPIO Read Successful and GPIO = %d, value = %d\n", m_gpio_id, m_gpio_value);
    }

    return 0;
}

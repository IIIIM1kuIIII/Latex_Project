clc; clear; close all;

% =========================
% 1. 定义序列
% =========================
n = 0:5;

% 输入序列 x[n] = δ[n] + 2δ[n-1] + δ[n-2]
x  = [1 2 1 0 0 0];

% 各单位冲激分量
x1 = [1 0 0 0 0 0];   % δ[n]
x2 = [0 2 0 0 0 0];   % 2δ[n-1]
x3 = [0 0 1 0 0 0];   % δ[n-2]

% 单位脉冲响应 h[n] = [1 2 1 1]
h  = [1 2 1 1 0 0];

% 各分量通过系统后的响应
y1 = [1 2 1 1 0 0];   % h[n]
y2 = [0 2 4 2 2 0];   % 2h[n-1]
y3 = [0 0 1 2 1 1];   % h[n-2]

% 最终输出
y  = y1 + y2 + y3;    % [1 4 6 5 3 1]

% =========================
% 2. 输出文件夹
% =========================
outFolder = '卷积图像输出';
if ~exist(outFolder, 'dir')
    mkdir(outFolder);
end

% =========================
% 3. 画图并保存
% =========================
plot_and_save(n, x,  'x[n] = delta[n] + 2delta[n-1] + delta[n-2]', ...
    'x[n]', 7, fullfile(outFolder, '图1_输入序列x[n].png'));

plot_and_save(n, x1, '第一项：delta[n]', ...
    'delta[n]', 2, fullfile(outFolder, '图2_第一项delta[n].png'));

plot_and_save(n, x2, '第二项：2delta[n-1]', ...
    '2delta[n-1]', 3, fullfile(outFolder, '图3_第二项2delta[n-1].png'));

plot_and_save(n, x3, '第三项：delta[n-2]', ...
    'delta[n-2]', 2, fullfile(outFolder, '图4_第三项delta[n-2].png'));

plot_and_save(n, y1, '第一项响应：delta[n] 到 h[n]', ...
    'h[n]', 7, fullfile(outFolder, '图5_第一项响应h[n].png'));

plot_and_save(n, y2, '第二项响应：2delta[n-1] 到 2h[n-1]', ...
    '2h[n-1]', 7, fullfile(outFolder, '图6_第二项响应2h[n-1].png'));

plot_and_save(n, y3, '第三项响应：delta[n-2] 到 h[n-2]', ...
    'h[n-2]', 7, fullfile(outFolder, '图7_第三项响应h[n-2].png'));

plot_and_save(n, y,  '输出序列 y[n] = h[n] + 2h[n-1] + h[n-2]', ...
    'y[n]', 7, fullfile(outFolder, '图8_输出序列y[n].png'));

disp('全部 PNG 图片已导出完成。');

% =========================
% 4. 局部函数
% =========================
function plot_and_save(n, s, ttl, ylab, ymax, filename)

    fig = figure('Color', 'w', 'Position', [200 200 700 350], 'Visible', 'on');
    ax = axes('Parent', fig);

    stem(ax, n, s, 'filled', 'LineWidth', 1.3);

    xlabel(ax, 'n');
    ylabel(ax, ylab, 'Interpreter', 'none');
    title(ax, ttl, 'Interpreter', 'none');

    set(ax, ...
        'Color', 'w', ...
        'Box', 'off', ...
        'LineWidth', 1, ...
        'FontSize', 11, ...
        'TickDir', 'out', ...
        'XLim', [0 5], ...
        'YLim', [0 ymax], ...
        'XTick', 0:5);

    % 不显示 y 轴数字，但保留坐标轴
    set(ax, 'YTickLabel', []);

    drawnow;

    % 用 print 代替 exportgraphics，更稳
    set(fig, 'PaperPositionMode', 'auto');
    print(fig, filename, '-dpng', '-r300');

    close(fig);
end
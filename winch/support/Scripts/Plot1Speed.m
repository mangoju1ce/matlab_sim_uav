% Code to plot simulation results from BlockAndTackle
%% Plot Description:
%
% The plot below shows the torque applied to the winch and the vertical
% speed of the load. Note that for the first second, no torque is applied
% to the winch, but the load still moves due to gravity.

% Copyright 2023 The MathWorks, Inc.

% Generate simulation results if they don't exist
if ~exist('simlogBlockAndTackle', 'var')
    sim('BlockAndTackle')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_BlockAndTackle', 'var') || ...
        ~isgraphics(h1_BlockAndTackle, 'figure')
    h1_BlockAndTackle = figure('Name', 'BlockAndTackle');
end
figure(h1_BlockAndTackle)
clf(h1_BlockAndTackle)

temp_colororder = get(gca,'defaultAxesColorOrder');

% Get simulation results
simlog_t      = simlogBlockAndTackle.Pulleys.Planar_Load.Py.v.series.time;
simlog_vLoad  = simlogBlockAndTackle.Pulleys.Planar_Load.Py.v.series.values('m/s');
simlog_tWinch = simlogBlockAndTackle.trqIn.PS_Gain.O.series.values;

% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_vLoad, 'LineWidth', 1)
hold off
grid on
title('Vertical Speed of Load')
ylabel('Speed (m/s)')

simlog_handles(2) = subplot(2, 1, 2);
plot(simlog_t, simlog_tWinch, 'LineWidth', 1)
grid on
title('Torque Applied to Winch')
ylabel('Torque (Nm)')
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles temp_colororder
clear simlog_vLoad simlog_tWinch
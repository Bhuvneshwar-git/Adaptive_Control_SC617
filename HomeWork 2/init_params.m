% --- Physical Parameters ---
m = 2.0;               % Mass (kg)
g = 9.81;              % Gravity
J = diag([0.00235, 0.00235, 0.0526]); % Inertia Matrix (Example values, adjust as needed)
J_inv = inv(J);

% --- Controller Gains (From your image) ---
% Identity Matrix helper
I3 = eye(3);

% Proportional & Integral Gains (K)
K1 = 1 * I3;      % Rotational Error Gain
K2 = 0.01 * I3;    % Translational Error Gain

% Backstepping Gains (A)
A1 = 0.4 * I3;    % Virtual Control Gain 1
A2 = 0.1 * I3;      % Virtual Control Gain 2

% Sliding Mode Gains (Q & Epsilon)
Q1 = 1 * I3;      % Sliding Surface Gain 1
Q2 = 2 * I3;     % Sliding Surface Gain 2

X2 = -A2*A2 + I3;
X1 = -A1*A1 + I3;
Y2 = A2 + Q2 + K2;
Y1 = A1 + Q1 + K1;

eps1 = 10;        % Switching Gain 1
eps2 = 2;         % Switching Gain 2

G = [0; 0; -g];

r_0 = [1; 0; 0];
v_0 = [0; 0.5; 0];
clear; % clear memory
clc; % clear comand window

m = 0.02; % set the mass of particle
q = 0.016; % set the charge
dt = 0.00001; % set the time infinitesimal
t = 0:dt:3; % set the time 0<t<3

figure(1);

for k = 0:3% choose 4 charges
    vx = linspace(0, 0, length(t)); vy = vx; vz = vx;
    vz(1) = 10;
    vx(1) = 0.1 * sin(k * pi / 2);
    vy(1) = 0.1 * cos(k * pi / 2); % choose directions at degree with n*pi/2
    rx = linspace(0, 0, length(t));
    ry = rx;
    rz = rx; % set the initial coordinates
    Ex = 0; Ey = 0; Ez = 0;
    Bx = 0; By = 0; Bz = 8; % set the field
    Fx = linspace(0, 0, length(t)); Fy = Fx; Fz = Fx;
    ax = linspace(0, 0, length(t)); ay = ax; az = ax; % set the list of force and acceleration

    for i = 1:(length(t) - 1)
        Fx(i) = q * (vy(i) * Bz - vz(i) * By);
        Fy(i) = q * (vz(i) * Bx - vx(i) * Bz);
        Fz(i) = q * (vx(i) * By - vy(i) * Bx); % calculate the F(t)

        ax(i) = Fx(i) / m;
        ay(i) = Fy(i) / m;
        az(i) = Fz(i) / m; % calculate the acceleration

        vx(i + 1) = vx(i) + ax(i) * dt;
        vy(i + 1) = vy(i) + ay(i) * dt;
        vz(i + 1) = vz(i) + az(i) * dt; % calculate V(t)

        rx(i + 1) = rx(i) + vx(i) * dt;
        ry(i + 1) = ry(i) + vy(i) * dt;
        rz(i + 1) = rz(i) + vz(i) * dt; % calculate next point
    end

    plot3(rx, ry, rz); % draw one track
    hold on;
end

grid on;
title('track of 4 charges in a magnetic field')% label the graph
xlabel('X-axis', 'fontSize', 12);
ylabel('Y-axis', 'fontSize', 12);
zlabel('Z-axis', 'fontSize', 12); % label the axis

figure(2);

for k = 0:15% choose 16 charges
    vx = linspace(0, 0, length(t)); vy = vx; vz = vx;
    vz(1) = 10;
    vx(1) = 0.1 * sin(k * pi / 8);
    vy(1) = 0.1 * cos(k * pi / 8); % choose directions at degree with n*pi/8

    rx = linspace(0, 0, length(t));
    ry = rx;
    rz = rx;

    Ex = 0; Ey = 0; Ez = 0;
    Bx = 0; By = 0; Bz = 8;

    Fx = linspace(0, 0, length(t)); Fy = Fx; Fz = Fx;
    ax = linspace(0, 0, length(t)); ay = ax; az = ax;

    for i = 1:(length(t) - 1)
        Fx(i) = q * (vy(i) * Bz - vz(i) * By);
        Fy(i) = q * (vz(i) * Bx - vx(i) * Bz);
        Fz(i) = q * (vx(i) * By - vy(i) * Bx);

        ax(i) = Fx(i) / m;
        ay(i) = Fy(i) / m;
        az(i) = Fz(i) / m;

        vx(i + 1) = vx(i) + ax(i) * dt;
        vy(i + 1) = vy(i) + ay(i) * dt;
        vz(i + 1) = vz(i) + az(i) * dt;

        rx(i + 1) = rx(i) + vx(i) * dt;
        ry(i + 1) = ry(i) + vy(i) * dt;
        rz(i + 1) = rz(i) + vz(i) * dt;
    end

    plot3(rx, ry, rz);
    hold on;

end

grid on;

title('Magnetic focusing of multiple charged particles in a magnetic field')
xlabel('X-axis', 'fontSize', 12);
ylabel('Y-axis', 'fontSize', 12);
zlabel('Z-axis', 'fontSize', 12);

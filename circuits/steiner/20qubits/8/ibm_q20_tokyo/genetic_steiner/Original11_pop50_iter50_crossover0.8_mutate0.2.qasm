// Initial wiring: [6, 9, 13, 10, 19, 5, 1, 17, 12, 16, 15, 7, 0, 8, 3, 14, 11, 4, 18, 2]
// Resulting wiring: [6, 9, 13, 10, 19, 5, 1, 17, 12, 16, 15, 7, 0, 8, 3, 14, 11, 4, 18, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[3], q[2];
cx q[12], q[6];
cx q[17], q[11];
cx q[11], q[9];
cx q[18], q[17];
cx q[19], q[18];
cx q[18], q[12];
cx q[19], q[18];

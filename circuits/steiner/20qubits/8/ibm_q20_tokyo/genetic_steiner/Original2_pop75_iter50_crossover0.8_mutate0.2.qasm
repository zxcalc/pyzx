// Initial wiring: [2, 4, 8, 7, 15, 6, 3, 9, 12, 16, 14, 1, 5, 0, 19, 17, 11, 10, 13, 18]
// Resulting wiring: [2, 4, 8, 7, 15, 6, 3, 9, 12, 16, 14, 1, 5, 0, 19, 17, 11, 10, 13, 18]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[3], q[2];
cx q[6], q[4];
cx q[18], q[12];
cx q[12], q[6];
cx q[18], q[12];
cx q[19], q[18];
cx q[11], q[17];
cx q[1], q[7];

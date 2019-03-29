// Initial wiring: [12, 18, 3, 16, 13, 17, 14, 2, 8, 0, 4, 7, 6, 15, 9, 5, 19, 10, 11, 1]
// Resulting wiring: [12, 18, 3, 16, 13, 17, 14, 2, 8, 0, 4, 7, 6, 15, 9, 5, 19, 10, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[5], q[4];
cx q[11], q[9];
cx q[18], q[12];
cx q[5], q[6];
cx q[1], q[8];

// Initial wiring: [17, 0, 12, 19, 7, 18, 15, 9, 8, 14, 6, 5, 13, 16, 11, 1, 3, 10, 4, 2]
// Resulting wiring: [17, 0, 12, 19, 7, 18, 15, 9, 8, 14, 6, 5, 13, 16, 11, 1, 3, 10, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[9], q[0];
cx q[5], q[14];
cx q[5], q[6];
cx q[2], q[3];
cx q[3], q[4];

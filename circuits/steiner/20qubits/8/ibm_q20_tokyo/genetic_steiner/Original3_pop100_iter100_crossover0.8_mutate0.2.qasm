// Initial wiring: [5, 0, 2, 11, 17, 15, 13, 3, 16, 4, 12, 9, 10, 8, 1, 14, 19, 7, 18, 6]
// Resulting wiring: [5, 0, 2, 11, 17, 15, 13, 3, 16, 4, 12, 9, 10, 8, 1, 14, 19, 7, 18, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[6], q[3];
cx q[7], q[2];
cx q[11], q[8];
cx q[16], q[14];
cx q[15], q[16];
cx q[12], q[17];
cx q[10], q[11];

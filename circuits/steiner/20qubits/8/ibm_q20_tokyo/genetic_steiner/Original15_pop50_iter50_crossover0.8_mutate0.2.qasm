// Initial wiring: [14, 15, 1, 9, 7, 19, 10, 3, 4, 2, 18, 6, 16, 13, 11, 12, 0, 5, 17, 8]
// Resulting wiring: [14, 15, 1, 9, 7, 19, 10, 3, 4, 2, 18, 6, 16, 13, 11, 12, 0, 5, 17, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[14], q[16];
cx q[9], q[11];
cx q[9], q[10];
cx q[8], q[10];
cx q[7], q[13];
cx q[3], q[5];
cx q[1], q[7];

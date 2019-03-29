// Initial wiring: [13, 2, 3, 14, 8, 11, 15, 16, 5, 0, 12, 18, 9, 19, 17, 1, 7, 10, 6, 4]
// Resulting wiring: [13, 2, 3, 14, 8, 11, 15, 16, 5, 0, 12, 18, 9, 19, 17, 1, 7, 10, 6, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[0];
cx q[15], q[10];
cx q[19], q[13];
cx q[12], q[14];

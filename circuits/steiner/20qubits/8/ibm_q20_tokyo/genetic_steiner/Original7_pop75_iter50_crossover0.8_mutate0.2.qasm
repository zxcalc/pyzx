// Initial wiring: [1, 19, 16, 14, 7, 0, 3, 13, 6, 18, 8, 2, 10, 11, 15, 5, 9, 12, 4, 17]
// Resulting wiring: [1, 19, 16, 14, 7, 0, 3, 13, 6, 18, 8, 2, 10, 11, 15, 5, 9, 12, 4, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[12], q[7];
cx q[13], q[7];
cx q[15], q[14];
cx q[16], q[14];
cx q[9], q[10];
cx q[7], q[8];
cx q[1], q[7];

// Initial wiring: [13, 9, 8, 3, 4, 0, 10, 15, 2, 14, 12, 5, 1, 7, 11, 6]
// Resulting wiring: [13, 9, 8, 3, 4, 0, 10, 15, 2, 14, 12, 5, 1, 7, 11, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[11], q[10];
cx q[15], q[14];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[15];
cx q[0], q[7];
cx q[7], q[8];
cx q[0], q[1];
cx q[8], q[7];

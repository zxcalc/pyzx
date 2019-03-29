// Initial wiring: [7, 3, 11, 8, 14, 12, 4, 1, 2, 15, 0, 5, 9, 10, 13, 6]
// Resulting wiring: [7, 3, 11, 8, 14, 12, 4, 1, 2, 15, 0, 5, 9, 10, 13, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[12], q[11];
cx q[13], q[10];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[14];
cx q[2], q[3];
cx q[0], q[7];
cx q[7], q[8];
cx q[7], q[6];

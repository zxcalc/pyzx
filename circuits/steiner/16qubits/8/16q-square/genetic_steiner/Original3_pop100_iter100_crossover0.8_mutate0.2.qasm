// Initial wiring: [10, 7, 9, 14, 6, 5, 2, 11, 1, 8, 13, 0, 4, 3, 12, 15]
// Resulting wiring: [10, 7, 9, 14, 6, 5, 2, 11, 1, 8, 13, 0, 4, 3, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[6];
cx q[12], q[11];
cx q[11], q[10];
cx q[13], q[12];
cx q[14], q[15];
cx q[0], q[7];
cx q[7], q[6];

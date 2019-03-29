// Initial wiring: [13, 5, 2, 10, 11, 14, 6, 7, 3, 1, 9, 0, 12, 8, 4, 15]
// Resulting wiring: [13, 5, 2, 10, 11, 14, 6, 7, 3, 1, 9, 0, 12, 8, 4, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[9];
cx q[14], q[15];
cx q[13], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[9], q[10];
cx q[4], q[5];

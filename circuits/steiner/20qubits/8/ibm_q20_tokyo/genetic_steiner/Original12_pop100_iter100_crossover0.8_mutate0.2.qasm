// Initial wiring: [19, 15, 9, 5, 10, 8, 4, 0, 14, 18, 7, 16, 6, 17, 3, 1, 2, 11, 12, 13]
// Resulting wiring: [19, 15, 9, 5, 10, 8, 4, 0, 14, 18, 7, 16, 6, 17, 3, 1, 2, 11, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[8];
cx q[11], q[9];
cx q[15], q[14];
cx q[13], q[16];
cx q[13], q[15];
cx q[9], q[11];
cx q[7], q[12];
cx q[5], q[14];

// Initial wiring: [2, 5, 1, 13, 14, 15, 0, 10, 7, 11, 6, 3, 8, 12, 9, 4]
// Resulting wiring: [2, 5, 1, 13, 14, 15, 0, 10, 7, 11, 6, 3, 8, 12, 9, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[10], q[9];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[10], q[13];
cx q[13], q[12];
cx q[0], q[7];

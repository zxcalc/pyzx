// Initial wiring: [1, 2, 11, 8, 12, 14, 15, 3, 7, 0, 10, 13, 4, 6, 5, 9]
// Resulting wiring: [1, 2, 11, 8, 12, 14, 15, 3, 7, 0, 10, 13, 4, 6, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[13], q[12];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[8], q[15];

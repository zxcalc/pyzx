// Initial wiring: [3, 5, 2, 10, 14, 6, 0, 9, 15, 7, 12, 4, 8, 11, 13, 1]
// Resulting wiring: [3, 5, 2, 10, 14, 6, 0, 9, 15, 7, 12, 4, 8, 11, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[15];
cx q[5], q[6];

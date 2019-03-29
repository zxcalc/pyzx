// Initial wiring: [11, 8, 9, 15, 10, 12, 6, 2, 0, 3, 13, 14, 1, 5, 7, 4]
// Resulting wiring: [11, 8, 9, 15, 10, 12, 6, 2, 0, 3, 13, 14, 1, 5, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[14], q[13];
cx q[14], q[9];
cx q[10], q[11];

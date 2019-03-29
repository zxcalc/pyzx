// Initial wiring: [9, 15, 0, 3, 2, 8, 6, 1, 4, 14, 13, 7, 5, 11, 10, 12]
// Resulting wiring: [9, 15, 0, 3, 2, 8, 6, 1, 4, 14, 13, 7, 5, 11, 10, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[12];
cx q[14], q[15];
cx q[10], q[11];
cx q[2], q[3];

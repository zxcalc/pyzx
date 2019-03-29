// Initial wiring: [8, 9, 15, 10, 7, 1, 13, 4, 11, 5, 2, 3, 0, 6, 14, 12]
// Resulting wiring: [8, 9, 15, 10, 7, 1, 13, 4, 11, 5, 2, 3, 0, 6, 14, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[14], q[15];
cx q[10], q[11];
cx q[6], q[7];

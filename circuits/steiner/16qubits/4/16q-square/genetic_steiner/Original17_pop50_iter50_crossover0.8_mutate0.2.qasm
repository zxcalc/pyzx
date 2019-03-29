// Initial wiring: [14, 12, 6, 2, 15, 8, 0, 3, 10, 1, 11, 7, 5, 9, 4, 13]
// Resulting wiring: [14, 12, 6, 2, 15, 8, 0, 3, 10, 1, 11, 7, 5, 9, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[9];
cx q[10], q[13];
cx q[6], q[7];
cx q[0], q[7];

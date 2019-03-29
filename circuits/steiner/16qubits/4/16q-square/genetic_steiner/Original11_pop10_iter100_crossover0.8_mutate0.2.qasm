// Initial wiring: [0, 3, 14, 2, 15, 6, 13, 9, 4, 7, 10, 12, 8, 5, 11, 1]
// Resulting wiring: [0, 3, 14, 2, 15, 6, 13, 9, 4, 7, 10, 12, 8, 5, 11, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[10], q[11];
cx q[6], q[9];
cx q[0], q[1];

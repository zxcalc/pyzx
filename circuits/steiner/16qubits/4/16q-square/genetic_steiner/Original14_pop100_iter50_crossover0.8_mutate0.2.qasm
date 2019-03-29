// Initial wiring: [15, 7, 2, 8, 1, 14, 6, 12, 9, 10, 0, 13, 5, 3, 11, 4]
// Resulting wiring: [15, 7, 2, 8, 1, 14, 6, 12, 9, 10, 0, 13, 5, 3, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[6], q[9];
cx q[6], q[7];
cx q[0], q[1];

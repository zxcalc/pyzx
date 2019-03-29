// Initial wiring: [13, 9, 3, 10, 7, 11, 5, 1, 0, 6, 8, 14, 12, 4, 15, 2]
// Resulting wiring: [13, 9, 3, 10, 7, 11, 5, 1, 0, 6, 8, 14, 12, 4, 15, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[15], q[0];
cx q[11], q[12];
cx q[12], q[13];

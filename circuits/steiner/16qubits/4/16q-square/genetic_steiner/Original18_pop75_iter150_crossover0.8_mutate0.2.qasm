// Initial wiring: [13, 8, 7, 0, 6, 1, 14, 11, 3, 4, 2, 15, 12, 9, 5, 10]
// Resulting wiring: [13, 8, 7, 0, 6, 1, 14, 11, 3, 4, 2, 15, 12, 9, 5, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[12], q[13];
cx q[11], q[12];
cx q[10], q[13];

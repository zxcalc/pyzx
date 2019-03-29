// Initial wiring: [15, 14, 5, 6, 13, 3, 10, 7, 12, 4, 9, 11, 2, 8, 1, 0]
// Resulting wiring: [15, 14, 5, 6, 13, 3, 10, 7, 12, 4, 9, 11, 2, 8, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[8], q[7];
cx q[11], q[12];
cx q[12], q[13];

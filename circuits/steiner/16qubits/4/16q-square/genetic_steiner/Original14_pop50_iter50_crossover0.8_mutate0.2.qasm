// Initial wiring: [7, 8, 2, 10, 6, 12, 9, 15, 5, 14, 4, 11, 3, 13, 0, 1]
// Resulting wiring: [7, 8, 2, 10, 6, 12, 9, 15, 5, 14, 4, 11, 3, 13, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[11], q[12];
cx q[4], q[5];

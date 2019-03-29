// Initial wiring: [7, 3, 1, 9, 0, 10, 11, 15, 4, 14, 6, 12, 8, 5, 2, 13]
// Resulting wiring: [7, 3, 1, 9, 0, 10, 11, 15, 4, 14, 6, 12, 8, 5, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[0];
cx q[10], q[5];
cx q[10], q[11];

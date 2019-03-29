// Initial wiring: [10, 1, 15, 2, 14, 8, 5, 13, 6, 7, 11, 4, 3, 12, 0, 9]
// Resulting wiring: [10, 1, 15, 2, 14, 8, 5, 13, 6, 7, 11, 4, 3, 12, 0, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[5];
cx q[12], q[13];
cx q[6], q[7];

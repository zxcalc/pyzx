// Initial wiring: [1, 2, 9, 7, 0, 12, 4, 13, 15, 3, 5, 14, 10, 11, 6, 8]
// Resulting wiring: [1, 2, 9, 7, 0, 12, 4, 13, 15, 3, 5, 14, 10, 11, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[13], q[12];
cx q[12], q[11];
cx q[10], q[13];

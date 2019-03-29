// Initial wiring: [5, 7, 11, 8, 0, 1, 3, 6, 9, 15, 14, 2, 13, 12, 4, 10]
// Resulting wiring: [5, 7, 11, 8, 0, 1, 3, 6, 9, 15, 14, 2, 13, 12, 4, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[11], q[12];
cx q[10], q[13];
cx q[13], q[14];

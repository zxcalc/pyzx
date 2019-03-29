// Initial wiring: [5, 10, 2, 15, 4, 9, 7, 0, 14, 11, 1, 12, 8, 3, 6, 13]
// Resulting wiring: [5, 10, 2, 15, 4, 9, 7, 0, 14, 11, 1, 12, 8, 3, 6, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[9], q[6];
cx q[6], q[1];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[14], q[9];
cx q[14], q[13];

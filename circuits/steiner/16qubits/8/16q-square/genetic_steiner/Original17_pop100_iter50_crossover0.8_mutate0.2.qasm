// Initial wiring: [5, 13, 7, 9, 1, 6, 14, 10, 2, 11, 8, 4, 15, 12, 0, 3]
// Resulting wiring: [5, 13, 7, 9, 1, 6, 14, 10, 2, 11, 8, 4, 15, 12, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[4];
cx q[4], q[3];
cx q[14], q[9];
cx q[9], q[6];
cx q[11], q[12];
cx q[10], q[11];
cx q[10], q[13];
cx q[11], q[12];

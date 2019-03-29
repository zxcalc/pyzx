// Initial wiring: [10, 11, 14, 6, 2, 12, 5, 3, 7, 15, 8, 4, 1, 9, 0, 13]
// Resulting wiring: [10, 11, 14, 6, 2, 12, 5, 3, 7, 15, 8, 4, 1, 9, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[10], q[5];
cx q[14], q[1];
cx q[11], q[12];
cx q[10], q[11];
cx q[3], q[12];
cx q[12], q[13];
cx q[1], q[2];

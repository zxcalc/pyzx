// Initial wiring: [3, 5, 0, 11, 14, 4, 1, 9, 7, 6, 8, 12, 15, 10, 2, 13]
// Resulting wiring: [3, 5, 0, 11, 14, 4, 1, 9, 7, 6, 8, 12, 15, 10, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[5];
cx q[10], q[9];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[5], q[6];
cx q[6], q[7];
cx q[2], q[3];
cx q[3], q[4];

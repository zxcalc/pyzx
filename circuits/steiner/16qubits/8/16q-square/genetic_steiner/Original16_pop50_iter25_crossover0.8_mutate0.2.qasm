// Initial wiring: [4, 9, 10, 15, 8, 5, 14, 2, 3, 0, 11, 7, 6, 12, 13, 1]
// Resulting wiring: [4, 9, 10, 15, 8, 5, 14, 2, 3, 0, 11, 7, 6, 12, 13, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[7], q[0];
cx q[9], q[6];
cx q[6], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[12];
cx q[10], q[13];

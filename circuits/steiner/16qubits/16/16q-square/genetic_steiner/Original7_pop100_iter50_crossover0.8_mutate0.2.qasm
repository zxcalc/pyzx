// Initial wiring: [2, 9, 11, 8, 7, 15, 10, 0, 13, 1, 5, 3, 14, 6, 4, 12]
// Resulting wiring: [2, 9, 11, 8, 7, 15, 10, 0, 13, 1, 5, 3, 14, 6, 4, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[10];
cx q[14], q[15];
cx q[10], q[13];
cx q[9], q[10];
cx q[6], q[9];
cx q[9], q[10];
cx q[9], q[8];
cx q[4], q[11];
cx q[4], q[5];
cx q[3], q[4];
cx q[1], q[2];
cx q[2], q[3];

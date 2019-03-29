// Initial wiring: [12, 14, 5, 9, 6, 4, 15, 8, 0, 7, 3, 10, 1, 11, 2, 13]
// Resulting wiring: [12, 14, 5, 9, 6, 4, 15, 8, 0, 7, 3, 10, 1, 11, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[4];
cx q[11], q[10];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[10];
cx q[15], q[14];
cx q[14], q[9];
cx q[15], q[14];
cx q[7], q[8];

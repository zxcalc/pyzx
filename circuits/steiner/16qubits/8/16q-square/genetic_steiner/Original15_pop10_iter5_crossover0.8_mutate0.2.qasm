// Initial wiring: [5, 8, 10, 11, 14, 0, 12, 9, 6, 1, 4, 2, 7, 15, 13, 3]
// Resulting wiring: [5, 8, 10, 11, 14, 0, 12, 9, 6, 1, 4, 2, 7, 15, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[5], q[4];
cx q[4], q[3];
cx q[5], q[4];
cx q[10], q[5];
cx q[11], q[4];
cx q[13], q[10];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[14], q[15];
cx q[11], q[12];
cx q[9], q[10];
cx q[1], q[2];

// Initial wiring: [12, 15, 13, 2, 6, 1, 14, 3, 10, 0, 9, 7, 5, 4, 11, 8]
// Resulting wiring: [12, 15, 13, 2, 6, 1, 14, 3, 10, 0, 9, 7, 5, 4, 11, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[2];
cx q[5], q[2];
cx q[11], q[4];
cx q[4], q[3];
cx q[11], q[4];
cx q[13], q[10];
cx q[14], q[15];
cx q[10], q[13];
cx q[13], q[12];
cx q[8], q[9];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[10];
cx q[10], q[13];
cx q[5], q[4];
cx q[13], q[10];

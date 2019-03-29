// Initial wiring: [12, 13, 9, 14, 0, 1, 6, 3, 5, 11, 15, 4, 2, 8, 7, 10]
// Resulting wiring: [12, 13, 9, 14, 0, 1, 6, 3, 5, 11, 15, 4, 2, 8, 7, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[11], q[4];
cx q[4], q[3];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[8];
cx q[12], q[13];
cx q[1], q[2];

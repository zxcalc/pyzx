// Initial wiring: [14, 6, 4, 12, 0, 13, 3, 1, 10, 5, 15, 7, 8, 11, 9, 2]
// Resulting wiring: [14, 6, 4, 12, 0, 13, 3, 1, 10, 5, 15, 7, 8, 11, 9, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[12], q[11];
cx q[14], q[13];
cx q[13], q[12];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[6], q[9];
cx q[2], q[3];

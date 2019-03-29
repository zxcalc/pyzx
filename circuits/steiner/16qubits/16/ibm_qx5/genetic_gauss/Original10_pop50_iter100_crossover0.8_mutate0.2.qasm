// Initial wiring: [14, 12, 15, 7, 3, 6, 8, 5, 4, 0, 10, 11, 9, 2, 1, 13]
// Resulting wiring: [14, 12, 15, 7, 3, 6, 8, 5, 4, 0, 10, 11, 9, 2, 1, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[11], q[10];
cx q[13], q[8];
cx q[14], q[13];
cx q[14], q[12];
cx q[15], q[12];
cx q[8], q[1];
cx q[15], q[7];
cx q[7], q[11];
cx q[6], q[15];
cx q[10], q[13];
cx q[3], q[4];
cx q[4], q[3];
cx q[1], q[2];

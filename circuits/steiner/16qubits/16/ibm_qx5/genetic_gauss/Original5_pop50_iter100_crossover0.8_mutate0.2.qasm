// Initial wiring: [5, 1, 7, 11, 10, 13, 14, 0, 4, 9, 3, 6, 2, 12, 15, 8]
// Resulting wiring: [5, 1, 7, 11, 10, 13, 14, 0, 4, 9, 3, 6, 2, 12, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[6], q[0];
cx q[7], q[6];
cx q[7], q[1];
cx q[8], q[1];
cx q[13], q[3];
cx q[15], q[13];
cx q[3], q[0];
cx q[14], q[5];
cx q[14], q[6];
cx q[9], q[12];
cx q[7], q[9];
cx q[10], q[15];
cx q[4], q[9];
cx q[4], q[8];

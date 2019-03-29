// Initial wiring: [14, 4, 7, 9, 13, 3, 2, 5, 6, 15, 10, 11, 12, 0, 8, 1]
// Resulting wiring: [14, 4, 7, 9, 13, 3, 2, 5, 6, 15, 10, 11, 12, 0, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[0];
cx q[5], q[0];
cx q[7], q[6];
cx q[10], q[9];
cx q[11], q[9];
cx q[8], q[3];
cx q[6], q[5];
cx q[12], q[4];
cx q[12], q[13];
cx q[11], q[15];
cx q[9], q[13];
cx q[11], q[12];
cx q[4], q[9];
cx q[1], q[6];

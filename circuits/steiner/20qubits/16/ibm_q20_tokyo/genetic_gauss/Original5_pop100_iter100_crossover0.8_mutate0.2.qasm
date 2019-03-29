// Initial wiring: [15, 6, 13, 19, 16, 11, 2, 8, 12, 18, 14, 17, 1, 4, 7, 10, 9, 5, 0, 3]
// Resulting wiring: [15, 6, 13, 19, 16, 11, 2, 8, 12, 18, 14, 17, 1, 4, 7, 10, 9, 5, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[0];
cx q[14], q[9];
cx q[15], q[14];
cx q[15], q[12];
cx q[17], q[13];
cx q[15], q[2];
cx q[12], q[4];
cx q[19], q[1];
cx q[15], q[17];
cx q[7], q[18];
cx q[5], q[19];
cx q[3], q[16];
cx q[4], q[15];
cx q[5], q[14];
cx q[3], q[12];
cx q[5], q[7];

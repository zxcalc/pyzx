// Initial wiring: [18, 3, 11, 12, 15, 17, 19, 7, 16, 5, 4, 1, 0, 8, 14, 10, 6, 9, 13, 2]
// Resulting wiring: [18, 3, 11, 12, 15, 17, 19, 7, 16, 5, 4, 1, 0, 8, 14, 10, 6, 9, 13, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[8], q[7];
cx q[8], q[2];
cx q[8], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[8], q[1];
cx q[9], q[8];
cx q[10], q[9];
cx q[10], q[8];
cx q[12], q[11];
cx q[15], q[14];
cx q[15], q[13];
cx q[18], q[17];
cx q[10], q[19];
cx q[8], q[11];
cx q[11], q[18];
cx q[11], q[17];
cx q[7], q[12];
cx q[3], q[6];
cx q[3], q[4];

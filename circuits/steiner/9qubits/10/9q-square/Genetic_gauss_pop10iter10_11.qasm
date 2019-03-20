// Initial wiring: [0 1 3 2 5 7 6 4 8]
// Resulting wiring: [1 0 8 2 5 7 6 3 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[7], q[8];
cx q[4], q[7];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[0], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[4], q[1];
cx q[7], q[6];
cx q[1], q[2];
cx q[8], q[7];

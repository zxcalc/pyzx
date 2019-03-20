// Initial wiring: [0 2 3 1 4 7 5 6 8]
// Resulting wiring: [1 2 8 4 0 7 5 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[1], q[0];
cx q[1], q[2];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[7], q[4];
cx q[7], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[1], q[0];
cx q[1], q[0];
cx q[3], q[4];
cx q[1], q[4];
cx q[2], q[3];
cx q[1], q[2];
cx q[7], q[6];

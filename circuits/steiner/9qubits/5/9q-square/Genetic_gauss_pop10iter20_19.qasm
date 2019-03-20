// Initial wiring: [1 0 2 8 4 5 6 7 3]
// Resulting wiring: [3 0 2 8 1 5 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[1], q[4];
cx q[0], q[1];
cx q[7], q[4];

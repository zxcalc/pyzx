// Initial wiring: [0 1 3 2 7 5 4 6 8]
// Resulting wiring: [0 1 4 2 7 5 3 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[7], q[4];
cx q[5], q[4];
